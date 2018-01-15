using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RetailHub.U
{
    public partial class UserManagement : MetroFramework.Forms.MetroForm
    {
        public UserManagement()
        {
            InitializeComponent();
            this.Text = "User Management";
        }
        void GridAlignment()
        {
            // GridUser.
            GridUser.Columns[0].Visible = false;
            GridUser.Columns[1].Width = 300;
            GridUser.Columns[2].Width = 175;
            GridUser.Columns[3].Width = 100;

        }
        private void UserManagement_Load(object sender, EventArgs e)
        {
            GridAlignment();

        }
    }
}
