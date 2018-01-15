namespace RetailHub
{
    partial class Home
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblUsername = new MetroFramework.Controls.MetroLabel();
            this.Users = new System.Windows.Forms.TabPage();
            this.metroTabControl1 = new MetroFramework.Controls.MetroTabControl();
            this.UserManage = new System.Windows.Forms.TabPage();
            this.metroTabControl1.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblUsername
            // 
            this.lblUsername.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblUsername.AutoSize = true;
            this.lblUsername.Location = new System.Drawing.Point(632, 32);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(0, 0);
            this.lblUsername.TabIndex = 0;
            // 
            // Users
            // 
            this.Users.BackColor = System.Drawing.Color.White;
            this.Users.Location = new System.Drawing.Point(4, 38);
            this.Users.Name = "Users";
            this.Users.Size = new System.Drawing.Size(785, 398);
            this.Users.TabIndex = 0;
            this.Users.Text = "User";
            this.Users.Click += new System.EventHandler(this.Users_Click);
            // 
            // metroTabControl1
            // 
            this.metroTabControl1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.metroTabControl1.Controls.Add(this.Users);
            this.metroTabControl1.Controls.Add(this.UserManage);
            this.metroTabControl1.Location = new System.Drawing.Point(23, 71);
            this.metroTabControl1.Name = "metroTabControl1";
            this.metroTabControl1.SelectedIndex = 1;
            this.metroTabControl1.Size = new System.Drawing.Size(793, 440);
            this.metroTabControl1.TabIndex = 1;
            this.metroTabControl1.UseSelectable = true;
            // 
            // UserManage
            // 
            this.UserManage.Location = new System.Drawing.Point(4, 38);
            this.UserManage.Name = "UserManage";
            this.UserManage.Size = new System.Drawing.Size(785, 398);
            this.UserManage.TabIndex = 1;
            this.UserManage.Text = "Inventory";
            // 
            // Home
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(839, 534);
            this.Controls.Add(this.metroTabControl1);
            this.Controls.Add(this.lblUsername);
            this.Name = "Home";
            this.Text = "Home";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Home_FormClosed);
            this.Load += new System.EventHandler(this.Home_Load);
            this.metroTabControl1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private MetroFramework.Controls.MetroLabel lblUsername;
        private System.Windows.Forms.TabPage Users;
        private MetroFramework.Controls.MetroTabControl metroTabControl1;
        private System.Windows.Forms.TabPage UserManage;
    }
}