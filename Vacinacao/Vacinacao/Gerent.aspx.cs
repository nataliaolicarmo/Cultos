using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
//using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VacinaService.DAO;

namespace Vacinacao
{
    public partial class Gerent : Page
    {
        string strConexao = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdDados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Excluir"))
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

                if (commandArgs != null && commandArgs.Length > 1)
                {
                    int idPessoa = int.Parse(commandArgs[0]);
                    int idHoario = int.Parse(commandArgs[1]);

                    DAO service = new DAO();
                    service.ExcluirAgendamento(idPessoa, idHoario);

                    var listaAgenda = new VacinaService.DAO.DAO().SelecionarPessoaHorario();
                    if (listaAgenda != null && listaAgenda.Count > 0)
                    {
                        this.grdDados.DataSource = listaAgenda;
                        this.grdDados.DataBind();
                    }
                }
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    //To Export all pages
                    grdDados.AllowPaging = false;


                    grdDados.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A2, 15f, 15f, 15f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=agendaDoacao.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CarregarGrid();
        }

        protected void CarregarGrid()
        {
            if (txtFiltro.Text.Equals("@Passaporte77"))
            {
                var listaAgenda = new VacinaService.DAO.DAO().SelecionarPessoaHorario();
                if (listaAgenda != null && listaAgenda.Count > 0)
                {
                    this.grdDados.DataSource = listaAgenda;
                    this.grdDados.DataBind();
                }
            }
        }
    }
}