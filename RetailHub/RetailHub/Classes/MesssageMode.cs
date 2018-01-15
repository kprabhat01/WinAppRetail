using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MetroFramework;

namespace RetailHub
{
   class MesssageMode: MetroFramework.Forms.MetroForm
    {
        public MesssageMode(string Messageword,bool ErrorEnabel) {
            ShowMeessage(Messageword, ErrorEnabel);
        }
        public void ShowMeessage(string Message, bool EnableError) {
            MetroMessageBox.Show(this,"\n Please enter username", "Message", MessageBoxButtons.OK, EnableError?MessageBoxIcon.Error:MessageBoxIcon.Information);
        } 
    }
}
