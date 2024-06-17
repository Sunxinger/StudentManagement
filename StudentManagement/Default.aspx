<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentManagement.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生管理系统</title>
    <ext:ResourceManager runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <ext:Viewport runat="server" Layout="VBoxLayout">
            <Items>
                <ext:GridPanel ID="GridPanel1" runat="server" Title="学生列表" Height="400" Width="600" Frame="true">
                    <Store>
                        <ext:Store ID="Store1" runat="server" AutoLoad="true">
                            <Model>
                                <ext:Model ID="Model1" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="SId" />
                                        <ext:ModelField Name="Sname" />
                                        <ext:ModelField Name="Sage" Type="Date" />
                                        <ext:ModelField Name="Ssex" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                            <Proxy>
                                <ext:AjaxProxy Url="/Default.aspx?cmd=Load" Json="true">
                                    <Reader>
                                        <ext:JsonReader Root="data" TotalProperty="total" />
                                    </Reader>
                                </ext:AjaxProxy>
                            </Proxy>
                        </ext:Store>
                    </Store>
                    <ColumnModel>
                        <Columns>
                            <ext:Column DataIndex="SId" Text="学生编号" Flex="1" />
                            <ext:Column DataIndex="Sname" Text="姓名" Flex="1" />
                            <ext:DateColumn DataIndex="Sage" Text="出生日期" Flex="1" Format="yyyy-MM-dd" />
                            <ext:Column DataIndex="Ssex" Text="性别" Flex="1" />
                        </Columns>
                    </ColumnModel>
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:Button ID="btnAdd" runat="server" Text="添加学生" Icon="Add">
                                    <DirectEvents>
                                        <Click OnEvent="btnAdd_Click" />
                                    </DirectEvents>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                </ext:GridPanel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>
