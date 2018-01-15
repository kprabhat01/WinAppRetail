using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data;

namespace RetailHub
{

    static class SqlHelper
    {
        //private StringBuilder Query;

        public static DataTable ReturnSet(string query)
        {
            DataTable dt = new DataTable();
            try
            {
                using (MySqlConnection SqlCon = detail.Con)
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, SqlCon))
                    {
                        SqlCon.Open();
                        MySqlDataReader rd = cmd.ExecuteReader();
                        if (rd.HasRows)
                            dt.Load(rd);

                        SqlCon.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
                // throw ex;
            }
            return dt;
        }

        // This not for the paramtries function and can only used for the single query for the class useonly . 

       /* public static bool InsertInfo(string query)
        {
            try
            {
                using (MySqlConnection SqlCon = detail.Con)
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, SqlCon))
                    {
                        cmd.CommandTimeout = 250;
                        SqlCon.Open();

                        cmd.ExecuteNonQuery();
                        SqlCon.Close();

                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;

                return false;
            }
        }*/


        public static DataTable ReturnRow<T>(List<T> Selected, bool Whole = false)
        {
            DataTable dt = new DataTable();
            try
            {

                StringBuilder Query = new StringBuilder();
                Type ClassTab = typeof(T);
                using (MySqlConnection SqlCon = detail.Con)
                {
                    Query.Append("Select ");
                    if (Whole) Query.Append(" * ");
                    else
                    {
                        for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                            Query.Append(ClassTab.GetProperties()[i].Name + ",");
                        Query.Remove(Query.Length - 1, 1);
                    }
                    if (Selected.Count >= 1)
                        Query.Append(" from " + ClassTab.Name + " where Id is not null");
                    for (int z = 0; z < Selected.Count; z++)
                    {
                        for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                        {
                            if (ClassTab.GetProperties()[i].GetValue(Selected[z]) != null && ClassTab.GetProperties()[i].GetValue(Selected[z]).ToString().Length >= 1)
                                Query.Append(" and " + ClassTab.GetProperties()[i].Name + "=?" + ClassTab.GetProperties()[i].Name + z);
                        }
                    }
                    using (MySqlCommand cmd = new MySqlCommand(Query.ToString(), SqlCon))
                    {
                        for (int z = 0; z < Selected.Count; z++)
                        {
                            for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                            {
                                if (ClassTab.GetProperties()[i].GetValue(Selected[z]) != null && ClassTab.GetProperties()[i].GetValue(Selected[z]).ToString().Length >= 1)
                                    cmd.Parameters.Add("?" + ClassTab.GetProperties()[i].Name + z, MySqlDbType.VarChar).Value = ClassTab.GetProperties()[i].GetValue(Selected[z]);
                            }
                        }
                        cmd.CommandType = CommandType.Text;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        SqlCon.Open();
                        da.Fill(dt);
                        SqlCon.Close();
                    }

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        public static bool Add<T>(List<T> listValue, bool Entry = false)
        {
            try
            {
                MySqlCommand Cmd;
                StringBuilder Query = new StringBuilder();
                Type ClassTab = typeof(T);
                Query.AppendLine("Insert into " + ClassTab.Name + " ( ");
                for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                {
                    if (ClassTab.GetProperties()[i].Name.ToLower() == "id") continue;
                    Query.AppendLine(ClassTab.GetProperties()[i].Name + ",");
                }
                Query.Remove(Query.Length - 3, 3);
                Query.AppendLine(" ) values ");
                for (int i = 0; i < listValue.Count; i++)
                {
                    Query.Append(" (");
                    for (int z = 0; z < ClassTab.GetProperties().Count(); z++)
                    {
                        if (ClassTab.GetProperties()[z].Name.ToLower() == "id") continue;
                        Query.AppendLine("?" + ClassTab.GetProperties()[z].Name + i + ",");
                    }
                    Query.Remove(Query.Length - 3, 3);
                    Query.Append("),");
                }
                Query.Remove(Query.Length - 1, 1);
                using (MySqlConnection SqlCon = detail.Con)
                {
                    Cmd = new MySqlCommand(Query.ToString(), SqlCon);
                    for (int z = 0; z < listValue.Count; z++)
                        for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                        {
                            if (ClassTab.GetProperties()[i].Name.ToLower() == "id") continue;
                            Cmd.Parameters.Add("?" + ClassTab.GetProperties()[i].Name + z, MySqlDbType.VarChar).Value = ClassTab.GetProperties()[i].GetValue(listValue[z]);
                        }
                    SqlCon.Open();
                    Cmd.ExecuteNonQuery();
                    SqlCon.Close();
                    Entry = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Entry;
        }

        public static bool Update<T>(List<T> obj, bool Return = false)
        {
            try
            {
                MySqlCommand Cmd;
                StringBuilder Query = new StringBuilder();
                Type ClassTab = typeof(T);
                Query.Append("Update " + ClassTab.Name + " set ");
                for (int z = 0; z < obj.Count; z++)
                {
                    for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                    {
                        if (ClassTab.GetProperties()[i].GetValue(obj[z]) != null && ClassTab.GetProperties()[i].Name.ToLower() != "id")
                        {
                            Query.Append(ClassTab.GetProperties()[i].Name + "=?" + ClassTab.GetProperties()[i].Name + z + ",");
                        }
                    }
                }
                Query.Remove(Query.Length - 1, 1);
                Query.Append(" Where Id=?Id");

                using (MySqlConnection SqlCon = detail.Con)
                {
                    Cmd = new MySqlCommand(Query.ToString(), SqlCon);
                    for (int z = 0; z < obj.Count; z++)
                    {
                        for (int i = 0; i < ClassTab.GetProperties().Count(); i++)
                        {
                            if (ClassTab.GetProperties()[i].GetValue(obj[z]) != null)
                            {
                                if (ClassTab.GetProperties()[i].Name.ToString().ToLower() == "id")
                                    Cmd.Parameters.Add("?Id", MySqlDbType.VarChar).Value = ClassTab.GetProperties()[i].GetValue(obj[z]);
                                else if (ClassTab.GetProperties()[i].GetValue(obj[z]) != null)
                                    Cmd.Parameters.Add("?" + ClassTab.GetProperties()[i].Name + z, MySqlDbType.VarChar).Value = ClassTab.GetProperties()[i].GetValue(obj[z]);
                            }
                        }
                    }
                    SqlCon.Open();
                    Cmd.ExecuteNonQuery();
                    SqlCon.Close();
                    Return = true;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return Return;
        }
        public static bool Delete<T>(List<T> Obj, bool Return = false)
        {
            try
            {
             /*   MySqlCommand Cmd;
                StringBuilder Query = new StringBuilder();
                Type ClassTab = typeof(T);
                Query.Append("Delete from ");
                Query.Append(ClassTab.Name + " Where ");
                for (int i = 0; i < Obj.Count; i++)
                {
                    for (int z = 0; z < ClassTab.GetProperties().Count(); z++)
                    {

                    }

                }
                */

            }
            catch (Exception ex)
            {
                throw ex;
            }


            return Return;

        }

    }
}
