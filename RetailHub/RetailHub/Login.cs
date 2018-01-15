using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MetroFramework;
using MetroFramework.Forms;
using System.Windows.Forms;
using System.Diagnostics;
using System.Threading;

namespace RetailHub
{
    public partial class Login : MetroFramework.Forms.MetroForm
    {
        public Login()
        {
            InitializeComponent();
            this.MaximizeBox = false;
            
        }

        private void Login_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Length == 0 || txtPassword.Text.Length == 0) {
                MetroMessageBox.Show(this, "Username OR Password is still blank", "Login", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else
            {
                try
                {
                    MsgLabel.Text = "Loading..";
                    Application.DoEvents();
                    List<users> Usr = new List<users>();
                    Usr.Add(new users
                    {
                        Uname = txtUsername.Text,
                        Pwd = enc.CalculateMD5Hash(txtPassword.Text),
                        deleteflag = 0

                    });
                    Thread.Sleep(500);
                    MsgLabel.Text = "Checking Security..";
                    Application.DoEvents();
                    
                    DataTable dt = SqlHelper.ReturnRow(Usr);
                    if (dt.Rows.Count >= 1)
                    {
                        UserHelper.Uid = int.Parse(dt.Rows[0]["Id"].ToString());
                        UserHelper.UserName = dt.Rows[0]["Ufname"].ToString() + " " + dt.Rows[0]["Ulname"].ToString();
                        UserHelper.Utype = int.Parse(dt.Rows[0]["userlevel"].ToString());
                        Thread.Sleep(500);
                        this.Hide();
                        Home hm = new Home();
                        hm.Show();
                    }
                    else {
                        MetroMessageBox.Show(this, "Invaild Username and Password.", "Login", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }

                catch (Exception ex)
                {
                    writeme.errorname(ex);
                }

            }
                
               
        }
    }
}
