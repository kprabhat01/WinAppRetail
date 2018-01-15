using MetroFramework;
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
    public partial class ChangePassword : MetroFramework.Forms.MetroForm
    {
        public int? Userid;
        public ChangePassword()
        {
            InitializeComponent();
            this.MaximizeBox = false;
            this.MinimizeBox = false;
        }

        private void ChangePassword_Load(object sender, EventArgs e)
        {

        }

        private void metroLabel1_Click(object sender, EventArgs e)
        {

        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text.Length == 0 || txtRePassword.Text.Length == 0)
                MetroMessageBox.Show(this, "Password OR Confirm Password is blank.", "Login", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else if (txtPassword.Text != txtRePassword.Text)
                MetroMessageBox.Show(this, "Password doesn't match Confirm Password.", "Login", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {

                List<users> Usr = new List<users>();
                Usr.Add(new users
                {
                    Id = Userid == null ? UserHelper.Uid : Userid,
                    Pwd = enc.CalculateMD5Hash(txtPassword.Text)
                });
                if (SqlHelper.Update(Usr))
                {
                    MetroMessageBox.Show(this, "Password has been successfully changed.", "Login", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
            }
        }
    }
}
