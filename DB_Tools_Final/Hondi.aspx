<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hondi.aspx.cs" Inherits="DB_Tools_Final.Hondi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hondi Car Selection</title>
    <style>
        .auto-style1 {
            text-align: center;
            color: white;
            text-shadow: 2px 2px 4px #000000;
        }
        .auto-style2 {
            width: 415px;
        }
        .auto-style3 {
            width: 400px;
            text-align: center;
        }
        .auto-style4 {
            height: 55px;
            width: 95px;
        }
        .auto-style5 {
            margin-left: 0px;
            margin-top: 0px;
        }
        .auto-style6 {
            width: 270px;
            text-align: left;
        }
        .auto-style7 {
            height: 55px;
            width: 270px;
        }
        .auto-style8 {
            margin-top: 0px;
            border-radius: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
        }
        .auto-style9 {
            width: 730px;
            height: 580px;
        }
        .auto-style10 {
            width: 95px;
            text-align: left;
        }
        .auto-style11 {
            width: 500px;
        }
        .auto-style12 {
            height: 115px;
            border-radius: 20px;
            margin-left: auto;
            margin-right: auto;
        }
        .stylePanel {
            border-radius: 50px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
        }
        .tecbox {
            border-radius: 10px;
        }
        .auto-style14 {
            text-align: center;
        }
        .auto-style15{
            margin-top: 0px;
            border-radius: 50px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
        }
        .btnCondlude {
            justify-content: right;
        }
    </style>
    
</head>
<body style="background: rgb(63,94,251); background: linear-gradient(90deg, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);">
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1"> Hondi Build & Price</h1>
        </div>

        <hr class="auto-style2"/>
        <br />

        <table class="auto-style12">
            <tr style="vertical-align:top">
                <td class="auto-style12">
                    <asp:Panel ID="panCar" runat="server" CssClass="stylePanel" BackColor="#BB96FF" GroupingText="Car Informations" Height="100%" Width="450px">
                        <table class="auto-style3">

                            <%--Customer--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblCity" runat="server" AccessKey="c" Text="Your City" AssociatedControlID="txtCity"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="tecbox" Width="200px"></asp:TextBox>
                                </td>

                            </tr>

                            <%--Zip Code--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblZip" runat="server" AccessKey="z" Text="Zip Code" AssociatedControlID="txtZip"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:TextBox ID="txtZip" runat="server" CssClass="tecbox" Width="200px"></asp:TextBox>
                                </td>

                            </tr>

                            <%--Car Model Selection--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblCar" runat="server" Text="Car"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:DropDownList ID="cboCar" runat="server" CssClass="tecbox" AutoPostBack="true" OnSelectedIndexChanged="cboCar_SelectedIndexChanged" Width="200px">
                                        <asp:ListItem>Select Car Model</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <%--Car Interior Color--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblColor" runat="server" Text="Interior Color"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:ListBox ID="listColor" runat="server" CssClass="tecbox" AutoPostBack="true" Width="200px"></asp:ListBox>
                                </td>
                            </tr>

                            <%--Accessories--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblAccessories" runat="server" Text="Accessories"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:CheckBoxList ID="chklstAccessories" runat="server" AutoPostBack="true"></asp:CheckBoxList>
                                </td>
                            </tr>

                            <%--Warranty--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblWarranty" runat="server" Text="Warranty"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:RadioButtonList ID="radlstWarranty" runat="server" AutoPostBack="true"></asp:RadioButtonList>
                                </td>
                            </tr>

                            <%--Contact--%>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblContact" runat="server" Text="Dealer contact you by phone?"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                    <asp:CheckBox ID="chkboxContact" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxContact_CheckedChanged"/>
                                </td>
                            </tr>

                            <%--Phone number--%>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                                </td>

                                <td class="auto-style6">
                                   <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" CssClass="tecboc" Width="200px"></asp:TextBox>
                                </td>
                            </tr>

                        </table>
                    </asp:Panel>
                </td>

                <%--2nd column--%>

                <td class="auto-style12">
                    <asp:Panel ID="panPricing" runat="server" GroupingText="Price Resume" BackColor="#BB96FF" Height="250px" Width="450px" CssClass="auto-style8">

                        <asp:Literal ID="litPricing" runat="server"> </asp:Literal>
                        <br />
                        <asp:Button ID="btnConclude" runat="server" Text="Conclude"  OnClick="btnConclude_Click1" />

                    </asp:Panel>

                    <br />

                    <asp:Panel ID="panFinal" runat="server" CssClass="auto-style15" GroupingText="Final Informations" BackColor="#BB96FF">

                           <asp:Literal ID="litFinal" runat="server"> </asp:Literal>

                    </asp:Panel>
                </td>
            </tr>

            <tr>
                <td>
                    &nbsp;
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
