<%@ Page Title="Campanha Doação de Sangue" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vacinacao._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <img src="images/prosangue.png" alt="Sample Photo" />
        <h3><b>Campanha Doaçao de Sangue</b></h3>
    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblNome">Nome Completo: </asp:Label>
        <asp:TextBox runat="server" ID="txtNome" CssClass=""></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            ControlToValidate="txtNome"
            ErrorMessage="Campo obrigatório" runat="server" ForeColor="Red">               
        </asp:RequiredFieldValidator>
    </div>
    <div class="grupo">
        <asp:Label runat="server" ID="lblSexo" CssClass="">Sexo: </asp:Label>
        <%-- <asp:DropDownList ID="ColorList"
            runat="server">
            <asp:ListItem Selected="True" Value="F"> Feminino </asp:ListItem>
            <asp:ListItem Value="M"> Masculino </asp:ListItem>
        </asp:DropDownList>--%>


        <asp:RadioButtonList ID="rbSexo" runat="server">
            <asp:ListItem Value="F">Feminino</asp:ListItem>
            <asp:ListItem Value="M">Masculino</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblIdade">Idade: </asp:Label>
        <asp:TextBox runat="server" ID="txtIdade"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
            ControlToValidate="txtIdade"
            ErrorMessage="Campo obrigatório" runat="server" ForeColor="Red">               
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Rangevalidator1" ErrorMessage="Por favor, inserir valores entre 18-120." ForeColor="Red" ControlToValidate="txtIdade" MinimumValue="18" MaximumValue="99" runat="server" Type="Integer">
        </asp:RangeValidator>

    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblPeso">Peso: </asp:Label>
        <asp:TextBox runat="server" ID="txtPeso"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
            ControlToValidate="txtPeso"
            ErrorMessage="Campo obrigatório" runat="server" ForeColor="Red">               
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Rangevalidator2" ErrorMessage="Por favor, inserir somente números" ForeColor="Red" ControlToValidate="txtPeso" MinimumValue="1" MaximumValue="600" runat="server" Type="Integer">
        </asp:RangeValidator>

    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblRG">RG: </asp:Label>
        <asp:TextBox runat="server" ID="txtRG"></asp:TextBox>

    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblCPF">CPF: </asp:Label>
        <asp:TextBox runat="server" ID="txtCPF"></asp:TextBox>
    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblCelular">Celular: </asp:Label>
        <asp:TextBox runat="server" ID="txtCelular"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            ControlToValidate="txtCelular"
            ErrorMessage="Campo obrigatório" runat="server" ForeColor="Red">               
        </asp:RequiredFieldValidator>
    </div>
    <div class="campo">
        <asp:Label runat="server" ID="Label1">Horários disponíveis: </asp:Label>
        <asp:DropDownList ID="dwlHoarios"
            runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator1"
            runat="server"
            ControlToValidate="dwlHoarios"
            InitialValue="Selecione um horário..."
            ErrorMessage="Selecione um horário para agendamento"
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </div>
    <%--    <div class="campo">
        <asp:RadioButtonList ID="radio1" runat="server" RepeatLayout="Table" RepeatDirection="Vertical">
        </asp:RadioButtonList>
    </div>--%>
    <asp:HiddenField ID="hiden" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Agendar Horário" class="btn btn-primary btn-lg btn-block" OnClick="Button1_Click"></asp:Button>


</asp:Content>
