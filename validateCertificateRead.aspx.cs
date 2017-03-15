using System;
using System.Security.Cryptography;
using System.Security.Permissions;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Collections.Generic;
using System.Data;


namespace ReadUploadedCertificate
{
    public partial class validateCertificateRead : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            X509Store _certStore = null;

            lblMessage.Text = string.Empty;
            string _strCertificateAppSettings = string.Empty;
            lblCertificateSettingValue.Text = string.Empty;

            try
            {
                _certStore = new X509Store(StoreName.My, StoreLocation.CurrentUser);
                _certStore.Open(OpenFlags.ReadOnly);

                // check whether App setting is done or not WEBSITE_LOAD_CERTIFICATES
                _strCertificateAppSettings = Environment.GetEnvironmentVariable("APPSETTING_WEBSITE_LOAD_CERTIFICATES");

                if (string.IsNullOrEmpty(_strCertificateAppSettings) != true)
                {
                    lblCertificateSettingValue.Text = "WEBSITE_LOAD_CERTIFICATES";
                    lblCertificateSettingValue.Text = lblCertificateSettingValue.Text + "<b>    :   </b>" + "<b>" + _strCertificateAppSettings + "</b>";
                    X509Certificate2Collection col = _certStore.Certificates;

                    DataTable table = prepareDataTable();
                    DataRow dRow;

                    if (_certStore.Certificates.Count > 0)
                    {
                        foreach (X509Certificate2 col1 in _certStore.Certificates)
                        {

                            dRow = table.NewRow();
                            dRow["Issuer_Name"] = Convert.ToString(col1.IssuerName.Name) != string.Empty ? col1.IssuerName.Name : string.Empty;
                            dRow["Subject_Name"] = Convert.ToString(col1.SubjectName.Name) != string.Empty ? col1.SubjectName.Name : string.Empty; ;
                            dRow["Thumbprint"] = Convert.ToString(col1.Thumbprint) != string.Empty ? col1.Thumbprint : string.Empty; ;
                            dRow["Has_Private_Key"] = Convert.ToString(col1.HasPrivateKey) != string.Empty ? Convert.ToString(col1.HasPrivateKey) : string.Empty; ;
                            dRow["Expiration_Date"] = Convert.ToString(col1.GetExpirationDateString()) != string.Empty ? col1.GetExpirationDateString() : string.Empty; ;
                            dRow["Is_Exportable"] = isPrivateKeyExportable(col1);

                            table.Rows.Add(dRow);

                        } // end of foreach

                        grdCertificateDetails.DataSource = table;
                        grdCertificateDetails.DataBind();
                    }
                    else
                    {
                       
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Unable to read certificate for App Setting  - " + lblCertificateSettingValue.Text;
                    }

                } // end of if condition  if (_strCertificateAppSettings != null )
                else
                {
                    
                    lblCertificateSettingValue.ForeColor = System.Drawing.Color.Red;
                    lblCertificateSettingValue.Text = "WEBSITE_LOAD_CERTIFICATES, App Setting not found.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = " <br> Required App Setting not found. <br>Refer Prerequisites secton.";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _certStore.Close();
            }
        }


        private bool isPrivateKeyExportable(X509Certificate2 col1)
        {
            bool _exportable = false;

            try
            {
                ICspAsymmetricAlgorithm key = (ICspAsymmetricAlgorithm)col1.PrivateKey;
                if (key != null)
                {
                    _exportable = key.CspKeyContainerInfo.Exportable;
                }
            }
            catch { }

            return _exportable;
        }


        private DataTable prepareDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Issuer_Name", typeof(string));
            table.Columns.Add("Subject_Name", typeof(string));
            table.Columns.Add("Thumbprint", typeof(string));
            table.Columns.Add("Is_Exportable", typeof(string));
            table.Columns.Add("Has_Private_Key", typeof(string));
            table.Columns.Add("Expiration_Date", typeof(string));
            return table;
        }


        // Change the rolw color only if Is Exportable is FALSE
        // or Has Private Key is FALSE

        protected void grdCertificateDetails_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {

            {
                if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
                {
                    if ((string.IsNullOrEmpty(e.Row.Cells[3].Text) != true))
                    {
                        string result = Convert.ToString(e.Row.Cells[3].Text);

                        if (result.ToUpper() == "FALSE")
                        {
                            e.Row.BackColor = System.Drawing.Color.Orange;
                        }
                    }
                }

                if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
                {
                    if ((string.IsNullOrEmpty(e.Row.Cells[4].Text) != true))
                    {
                        string result = Convert.ToString(e.Row.Cells[4].Text);

                        if (result.ToUpper() == "FALSE")
                        {
                            e.Row.BackColor = System.Drawing.Color.Orange;
                        }
                    }
                }

            }
        }
    }
}