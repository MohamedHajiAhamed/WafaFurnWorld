<%@ Page Title="" Language="C#" MasterPageFile="~/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="view_product.aspx.cs" Inherits="Electronic_Kingdom.customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>View Products</title>
        <style>
         .customer h1{
    margin: 20px;
}
            .auto-style1 {
                margin-top: 49px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <div class="col-9">
            <section class="customer">
                <h1>View/Edit Products</h1>
                <hr />
                <form runat="server">
    <div class="container-fluid">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Product Name / Product ID</label>
                    <asp:TextBox type="text" class="form-control" id="txtbox_product_name" runat="server"></asp:TextBox>
                </div>
                            <asp:Button ID="btn_search" style="width: 100%"  class="btn btn-primary" runat="server" Text="Search" OnClick="btn_search_Click"  />
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" CssClass="auto-style1" GridLines="None" Width="940px" ForeColor="#333333" Height="200px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Width="200px" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
           <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton_select" runat="server" OnClick="LinkButton_select_Click">Edit/<span style="color:red">Delete</span> </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        </asp:GridView>
                            <section>
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
       <button type="button" id="model-close"  class="btn btn-danger" onclick="location.href = 'add_products.aspx';" >Close</button>
      </div>
    </div>
  </div>
</div>
    </section>
        </div>
                    </form>
            </section>
        </div>
    </div>
</div>
</asp:Content>
