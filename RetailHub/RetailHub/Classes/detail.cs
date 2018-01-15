using MySql.Data.MySqlClient;
using System.Configuration;

namespace RetailHub
{
    class detail
    {        
        public static MySqlConnection Con
        {
            get
            {
                return new MySqlConnection(ConfigurationSettings.AppSettings.Get("Con"));
            }
        }
    }
}
