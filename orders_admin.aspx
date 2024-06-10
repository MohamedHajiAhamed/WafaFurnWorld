<%@ Page Title="" Language="C#" MasterPageFile="~/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="orders_admin.aspx.cs" Inherits="Electronic_Kingdom.orders_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Orders</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="col-9">
            <section class="orders">
                <h1>Orders</h1>
                <div class="container-fluid" style="margin-left:-80px">
                    <div class="row">
                        <div class="col-lg-4">
                            <form runat="server">
                                <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="0" Width="131px" GridLines="None" Height="120px" ForeColor="Black" CssClass="offset-sm-0">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <EditRowStyle HorizontalAlign="Center" Wrap="False" />
                                    <FooterStyle BackColor="Tan" />
                                    <HeaderStyle BackColor="Tan" Font-Bold="True" HorizontalAlign="Center" Width="1000px" Wrap="False" />
                                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" Width="1000px" />
                                    <RowStyle BorderStyle="Solid" HorizontalAlign="Center" Wrap="False" />
                                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                </asp:GridView>
                            </form>
                    </div>
                        </div>
                </div>
            </section>
        </div>
    </div>
</div>
</asp:Content>
