using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RetailHub
{
    public partial class Home : MetroFramework.Forms.MetroForm
    {
        public Home()
        {
            InitializeComponent();
            this.Text = "Retail HUB";
        }
        private void Home_Load(object sender, EventArgs e)
        {
            lblUsername.Text = UserHelper.UserName;
            UserPage P = new UserPage();
            Users.Controls.Add(P);
        }
        private void Home_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void ChPasscode_Click(object sender, EventArgs e)
        {
            U.ChangePassword Pass = new U.ChangePassword();
            Pass.ShowDialog();
        }

        private void metroTile2_Click(object sender, EventArgs e)
        {

        }

        private void tabPage1_Click(object sender, EventArgs e)
        {
           
        }

        private void Users_Click(object sender, EventArgs e)
        {
          
        }
    }
}
