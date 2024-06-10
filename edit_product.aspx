<%@ Page Title="" Language="C#" MasterPageFile="~/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="edit_product.aspx.cs" Inherits="Electronic_Kingdom.edit_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit/Delete Product</title>
    <style>
        .price span, .price input {
            height: 40px;
        }

        .price input {
            height: 39px;
            border: 1px solid rgb(221 225 229);
            border-radius: 8px;
        }

        .add-product h1 {
            margin: 20px;
        }

        .img {
            margin-bottom: 10px;
            min-width: 300px;
            max-height:300px;
        }

        .btn-act {
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-9">
        <section class="add-product">
            <h1>Add Products</h1>
            <hr />
            <form runat="server">
                <div class="container-fluid">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Product Name</label>
                        <asp:TextBox type="text" class="form-control" ID="txtbox_product_name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Display="Dynamic" ControlToValidate="txtbox_product_name" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Product Categories</label>
                                <div class="input-group mb-3">
                                    <asp:DropDownList class="form-select" ID="txtbox_product_categories" runat="server" OnSelectedIndexChanged="txtbox_product_categories1_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem>Mobile</asp:ListItem>
                                        <asp:ListItem>HeadPhone</asp:ListItem>
                                        <asp:ListItem>TV</asp:ListItem>
                                        <asp:ListItem>Laptop</asp:ListItem>
                                        <asp:ListItem>Camera</asp:ListItem>
                                        <asp:ListItem>Speaker</asp:ListItem>
                                    </asp:DropDownList><br />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="txtbox_product_categories" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Product Sub Categories(Brand)</label>
                                <div class="input-group mb-3">
                                    <asp:DropDownList class="form-select" ID="txtbox_product_sub_categories" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="txtbox_product_sub_categories" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6">
                            <label for="exampleFormControlInput1" class="form-label">Price</label><br />

                            <asp:TextBox ID="txtbox_price" type="text" class="form-control" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" Display="Dynamic" ControlToValidate="txtbox_price" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Quantity</label>
                                <asp:TextBox ID="txtbox_quantity" type="text" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required Field" ControlToValidate="txtbox_quantity" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="validationTextarea" class="form-label">Product Image 1</label>
                                <div class="text-center">
                                    <asp:Image ID="product_image1" CssClass="img" Width="300px" AlternateText="No Image" runat="server" />
                                </div>
                                <asp:FileUpload ID="txtbox_pic1" type="file" class="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="validationTextarea" class="form-label">Product Image 2</label>
                                <div class="text-center">
                                    <asp:Image ID="product_image2" CssClass="img" Width="300px" AlternateText="No Image" runat="server" />
                                </div>
                                <asp:FileUpload ID="txtbox_pic2" type="file" class="form-control" runat="server" />
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="validationTextarea" class="form-label">Product Image 3</label>
                                <div class="text-center">
                                    <asp:Image ID="product_image3" CssClass="img" AlternateText="No Image" Width="300px" runat="server" />
                                </div>
                                <asp:FileUpload ID="txtbox_pic3" type="file" class="form-control" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="validationTextarea" class="form-label">Product description</label>
                        <asp:TextBox class="form-control" ID="txtbox_product_description" TextMode="MultiLine" Rows="3" placeholder="describe about product" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required Field" ControlToValidate="txtbox_product_description" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:Label ID="lbl_id" runat="server" Text="Label" Visible="False"></asp:Label>

                    </div>
                    <asp:Button ID="btn_update" Style="width: 30%; margin-left: 120px" type="submit" class="btn btn-warning btn-act" runat="server" Text="Update" OnClick="btn_update_Click" />
                    <asp:Button ID="btn_delete" Style="width: 30%; margin-left: 180px" type="submit" class="btn btn-danger btn-act" runat="server" Text="Delete" OnClick="btn_delete_Click" />
                </div>
            </form>
        </section>
        <section>
            <div class="modal" id="model" tabindex="-1" style="display: none">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Alert</h5>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lbl_txt" CssClass="text-black" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="model-close" class="btn btn-danger" onclick="location.href = 'view_product.aspx';">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    </div>
    </div>
    </div>
</asp:Content>
