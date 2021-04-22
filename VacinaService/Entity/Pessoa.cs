using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VacinaService.Entity
{
    public class Pessoa : Horario
    {
        public int IdPessoa { get; set; }
        public string NomeCompleto { get; set; }
        public string Sexo { get; set; }
        public string RG { get; set; }
        public string CPF { get; set; }
        public int Idade { get; set; }
        public int Peso { get; set; }
        public string Celular { get; set; }
    }
}