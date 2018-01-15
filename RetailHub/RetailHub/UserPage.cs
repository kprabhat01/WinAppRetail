using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RetailHub
{
    public partial class UserPage : MetroFramework.Controls.MetroUserControl
    {
        public UserPage()
        {
            InitializeComponent();
        }

        private void UserPage_Load(object sender, EventArgs e)
        {

        }

        private void metroTile1_Click(object sender, EventArgs e)
        {
            U.ChangePassword Pass = new U.ChangePassword();
            Pass.ShowDialog();
        }

        private void metroTile4_Click(object sender, EventArgs e)
        {
            U.UserManagement Manage = new U.UserManagement();
            Manage.ShowDialog();
        }
    }
}
