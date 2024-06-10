<%@ Page Title="" Language="C#" MasterPageFile="~/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="user_details.aspx.cs" Inherits="Electronic_Kingdom.user_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Details</title>
    <link rel="stylesheet" href="css/StyleDashboard.css">
    <style type="text/css">
        .auto-style1 {
            margin-left: 28;
        }
        .btn-act{
            margin-bottom:50px;
        }
                 .user-details h1{
    margin: 20px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <div class="col-9">
                <form runat="server">
            <section class="user-details">
                <h1>User Details</h1>
                <hr />
                 <div class="container-fluid">
     <div class="row">
         <div class="col-lg-6">
               <div class="mb-3">
     <label for="exampleFormControlInput1" class="form-label">User ID</label>
   <asp:TextBox ID="txtbox_user_id" runat="server" CssClass="form-control"></asp:TextBox>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Display="Dynamic" ControlToValidate="txtbox_user_id" ForeColor="#CC0000"></asp:RequiredFieldValidator>--%>
 </div>
     

              </div>
        
         <div class="col-lg-6">
             <div class="mb-3">
                 <label for="exampleFormControlInput1" class="form-label">User Type</label>
                 <div class="input-group mb-3">
                     <asp:DropDownList class="form-select" ID="txtbox_user_type" runat="server">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>Admin</asp:ListItem>
                         <asp:ListItem>User</asp:ListItem>
                     </asp:DropDownList>
                 </div>
<%--                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="txtbox_user_type" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>--%>
             </div>
         </div>
                                         <asp:Button ID="btn_submit" style="width: 30%;margin-left:120px" type="submit" class="btn btn-primary btn-act" runat="server" Text="Update" OnClick="btn_submit_Click"  />
                                         <asp:Button ID="btn_delete" style="width: 30%;margin-left:180px" type="submit" class="btn btn-danger btn-act" runat="server" Text="Delete" OnClick="btn_delete_Click" />
     </div>
<div class="modal" id="model" tabindex="-1" style="display:none">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Alert</h5>
      </div>
      <div class="modal-body">
        <asp:Label ID="lbl_txt" CssClass="text-black" runat="server" Text="Label"></asp:Label>
      </div>
      <div class="modal-footer">
       <button type="button" id="model-close" class="btn btn-danger" onclick="location.href = 'user_details.aspx';" >Close</button>
      </div>
    </div>
  </div>
</div>
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" GridLines="Horizontal" Width="940px" Height="100px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton_select" runat="server" OnClick="LinkButton_select_Click">Select</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

        </div>
            </section>
                        </form>
                     </div>
    </div>
</div>
</asp:Content>
