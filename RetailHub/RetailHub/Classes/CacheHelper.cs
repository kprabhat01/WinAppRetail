namespace RetailHub
{
    class CacheHelper
    {
        static CacheHelper()
        {
            UserHelper.GetUserInformation();
        }
        public static bool GetChacheValue() {
            return true;
        }
    }
}
