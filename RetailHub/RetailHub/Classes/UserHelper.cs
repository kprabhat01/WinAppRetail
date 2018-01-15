using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace RetailHub
{

    class users
    {
        public int? Id { get; set; }
        public string Ufname { get; set; }
        public string Ulname { get; set; }
        public string Uname { get; set; }
        public string Pwd { get; set; }
        public int? userlevel { get; set; }
        public int? ublk { get; set; }
        public string Comment { get; set; }
        public int? deleteflag { get; set; }
        public string CreatedBy { get; set; }
    }
    class UserHelper
    {
        public static DataTable UserList;
        public static int Uid;
        public static string UserName;
        public static int Utype;

        public static void GetUserInformation()
        {
            try
            {
                UserList = new DataTable();
                List<users> UsrValue = new List<users>();
                UsrValue.Add(new users
                {
                    deleteflag = 0
                });
                UserList = SqlHelper.ReturnRow(UsrValue);
            }
            catch (Exception ex)
            {
                writeme.errorname(ex);
            }
        }

    }
}
