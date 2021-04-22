<%@ Page Title="Cultos Presenciais" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vacinacao._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <%-- <img src="images/prosangue.png" alt="Sample Photo" />--%>
        <h2>
            <center><b>Retomada da Escola Sabatina e Culto Presencial</b></center>
        </h2>
        <br />
        <h5>
            <p>
                Nesse sábado dia 
                <asp:Label ID="Label1" runat="server"></asp:Label>
                teremos culto presencial com capacidade máxima de 
            <b>30 pessoas</b> devido a pandemia de Covid-19. 
            </p>


            <p>
                Para garantir a sua presença, será necessário preencher o nome completo e 
                telefone nos campos abaixo e clicar no botão confirmar presença.
            </p>

            <p style="color: black"><b>ATENÇÃO:</b></p>
            <p>
                1) É importante ressaltar que o uso de mascara é obrigatório.
            </p>
            <p>
                2) Recomendamos que evite qualquer tipo de cumprimentos com contato.
            </p>
            <p>
                3) Os irmãos que tiverem com sintomas de febre/gripe/resfriado pedimos encarecidamente para não comparecerem. 
            </p>
            <p>
                4) Para aqueles que estão em grupos de risco, visando sua proteção, disponibilizaremos o link para assistir o culto online.</b>
            </p>
        </h5>
        <br />
    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblNome" Style="font-size: larger">Nome Completo: </asp:Label>
        <asp:TextBox runat="server" ID="txtNome" CssClass=""></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            ControlToValidate="txtNome"
            ErrorMessage="Campo obrigatório" runat="server" ForeColor="Red">               
        </asp:RequiredFieldValidator>
    </div>
    <div class="campo">
        <asp:Label runat="server" ID="lblCelular" Style="font-size: larger">Telefone/Celular: </asp:Label>
        <asp:TextBox runat="server" ID="txtCelular"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            ControlToValidate="txtCelular"
            ErrorMessage="Campo obrigatório" runat="server" ForeColor="Red">               
        </asp:RequiredFieldValidator>
    </div>
    <asp:HiddenField ID="hiden" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Confirmar Presença" class="btn btn-primary btn-lg btn-block" OnClick="Button1_Click"></asp:Button>
    <br />
    <center>
        <asp:Label ID="Label2" runat="server" style="color:red;"></asp:Label>
    </center>
</asp:Content>
