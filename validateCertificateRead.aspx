<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validateCertificateRead.aspx.cs" Inherits="ReadUploadedCertificate.validateCertificateRead" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Certificate Read Checker</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>

    <style>
        #grdCertificateDetails {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            #grdCertificateDetails td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #grdCertificateDetails tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #grdCertificateDetails tr:hover {
                background-color: #ddd;
            }

            #grdCertificateDetails th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #6dbedd;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top" style="border-bottom: 3px solid orange; background-color:#006699">
            <div class="container" style="padding: 0; margin-left: 20px; padding-right: 20px; width: 100%">
                <div class="navbar-header">
                    <a class="navbar-brand" style="color:white;float:left" >Certificate Read Checker 1.0 (CRC)</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" style="float: right">
                        <li>
                            <a style="color:white" href="mailto:anilpras@microsoft.com">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container body-content" style="padding-top: 60px">
            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-sm-12 tab-body tab-content">
                        <div class="tab-pane active" id="sites">
                            <div class="row">
                                <div class="col-sm-12">
                                     <div style="width:120px; background-color:#4CAF50; color:white; padding-left:10px">What CRC does:</div> 
                                    <div style="width: 100%; border: 1px solid black; padding: 10px; margin-bottom: 30px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-color: orange">
                                        <p>
                                            <b>Certificate Read Checker</b> reads the uploaded certificate <a href="https://azure.microsoft.com/en-in/blog/using-certificates-in-azure-websites-applications/">as per the code</a>, If this extension can read the certificate details, then your code should be :).
                                        </p>
                                    </div>
                                         
                                         
                                    <div style="width:100px; background-color:#4CAF50; color:white; padding-left:10px">Prerequisites:</div> 
                                        <div style="width: 100%; border: 1px solid black; padding: 10px; margin-bottom: 30px;">
                                            Step# 1: Upload the certificate(s) to the azure portal
                                            <br />
                                            Step# 2: Configure App Settings &quot;WEBSITE_LOAD_CERTIFICATES = *, or Thumbprint or the certificate</>
                                            <br />
                                            Step# 3: Press, Ctrl + F5</>
                                            <br />
                                        </div>    

                                      <div style="width:190px; background-color:#4CAF50; color:white; padding-left:10px">App Setting Current Value:</div> 
                                    <div style="width: 100%; border: 1px solid black; padding: 10px; margin-bottom: 30px;">
                                        <asp:Label ID="lblCertificateSettingValue" runat="server" Font-Bold="False" ForeColor="#006699" Font-Italic="False">WEBSITE_LOAD_CERTIFICATES</asp:Label>
                                        </div>
                                </div>
                            </div>
                            <div style="width:100px; background-color:#4CAF50; color:white; padding-left:10px">Certificates:</div>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <div class="row" >
                                <div class="col-sm-12" style="overflow: auto; width: 100%; height: 600px;">
                                    <asp:GridView ID="grdCertificateDetails" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="grdCertificateDetails_RowDataBound">
                                        <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navbar navbar-inverse navbar-fixed-bottom" style="min-height: 30px; border-top: 3px solid orange; padding-top: 6px; color: white;background-color:#006699">
                <p>&copy; Certificate Read Checker version 1.0. <a  style="color:white" href="https://azure.microsoft.com/en-in/blog/using-certificates-in-azure-websites-applications/">Using certificate in azure websites</a></p>
            </div>
        </div>
    </form>
</body>
</html>


