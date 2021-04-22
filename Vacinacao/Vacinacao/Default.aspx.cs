using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VacinaService;
using VacinaService.DAO;
using VacinaService.Entity;
using System.Linq;

namespace Vacinacao
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CarregarDropHoario();
                var data = DateTime.Now;
                var sabado = 6 - (int)DateTime.Now.DayOfWeek;
          

                Label1.Text = DateTime.Now.AddDays(sabado).Date.ToString("dd/MM/yyyy");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Pessoa pessoa = new Pessoa();
            pessoa.NomeCompleto = txtNome.Text;
            pessoa.Celular = txtCelular.Text;

            DAO service = new DAO();
            service.SalvarAgendamento(pessoa);
            
            LimparComponentes();
            CarregarDropHoario();

            Response.Redirect("~/sucesso.aspx");

 
        }

        public void LimparComponentes()
        {
            txtNome.Text = String.Empty;           
            txtCelular.Text = String.Empty;           
        }

        public void CarregarDropHoario()
        {
            DAO service = new DAO();

            var horario = service.SelecionarHorario()[0].Quantidade;
            Label2.Text = "Restam " + horario.ToString() + " vagas!";
        }
    }
}