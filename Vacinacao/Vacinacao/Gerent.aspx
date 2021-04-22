<%@ Page Title="Campanha Doação de Sangue" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gerent.aspx.cs" Inherits="Vacinacao.Gerent" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




    <h3>Agenda</h3>

    <asp:TextBox ID="txtFiltro" runat="server" TextMode="Password"></asp:TextBox>
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Ok" />
    <br /><br />


    <asp:GridView ID="grdDados" runat="server" AutoGenerateColumns="false"
        OnRowCommand="grdDados_RowCommand" CellPadding="6" ForeColor="#333333"
        GridLines="Both">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#D4DFE9" />
        <FooterStyle BackColor="#D4DFE9" Font-Bold="True" ForeColor="Black" />
        <HeaderStyle BackColor="#D4DFE9" Font-Bold="True" ForeColor="Black" />
        <PagerStyle BackColor="#666666" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NomeCompleto" HeaderText="Nome Completo" />           
            <asp:BoundField DataField="Celular" HeaderText="Celular" />
            <asp:BoundField HeaderText="Observações" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnEditar" runat="server"
                        CommandName="Excluir" Text="Excluir Agend." onclientclick="return confirm('Confirma exlusão?');"
                        CommandArgument='<%#Eval("IdPessoa")+","+ Eval("IdHorario")%>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />

    <asp:Button ID="btnExportar" runat="server" Text="Exportar para PDF" class="btn btn-primary btn-sm" OnClick="btnExportar_Click"></asp:Button>
</asp:Content>
