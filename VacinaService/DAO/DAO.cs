using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using VacinaService.Entity;

namespace VacinaService.DAO
{
    public class DAO
    {

        public string GetConnectionString()
        {
            return ConfigurationManager.AppSettings["connectionString"];
        }
        public int SalvarAgendamento(Pessoa pessoa)
        {
            var connection = new MySqlConnection(GetConnectionString());  
            var command = connection.CreateCommand();
            var command2 = connection.CreateCommand();
            var command3 = connection.CreateCommand();

            try
            {
                connection.Open();             
                command.CommandText = "INSERT INTO USUARIO (NOMECOMPLETO, TELEFONE) VALUES (@NOMECOMPLETO, @TELEFONE)";

                command.Parameters.AddWithValue("@NOMECOMPLETO", pessoa.NomeCompleto);             
                command.Parameters.AddWithValue("@TELEFONE", pessoa.Celular);
                command.ExecuteNonQuery();
                if (command.LastInsertedId != 0)
                    command.Parameters.Add(new MySqlParameter("IdUsuario", command.LastInsertedId));

                var idUsuario = Convert.ToInt32(command.Parameters["@IdUsuario"].Value);

                command2.CommandText = "INSERT INTO USUARIO_HORARIO (IdUsuario, idHorario) VALUES (@idUsuario, @idHorario)";

                command2.Parameters.AddWithValue("@idUsuario", idUsuario);
                command2.Parameters.AddWithValue("@idHorario", 1);               
                command2.ExecuteNonQuery();


                command3.CommandText = "UPDATE HORARIO SET QUANTIDADE = QUANTIDADE - 1 WHERE idHorario = @idHorario";      
                command3.Parameters.AddWithValue("@idHorario", 1);
                command3.ExecuteNonQuery();
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                    connection.Close();
            }

            return 1;
        }

        public List<Horario> SelecionarHorario()
        {
            List<Horario> lstHorarios = new List<Horario>();
            
            var connection = new MySqlConnection(GetConnectionString());
            var command = connection.CreateCommand();

            try
            {
                connection.Open();
                command.CommandText = "SELECT IDHORARIO, HORARIO, QUANTIDADE FROM HORARIO";
                var dr = command.ExecuteReader();

                while(dr.Read())
                {
                    Horario hr = new Horario();
                    hr.IdHorario = int.Parse(dr["IDHORARIO"].ToString());
                    hr.HorarioDeAte = dr["HORARIO"].ToString();
                    hr.Quantidade = int.Parse(dr["QUANTIDADE"].ToString());
                    lstHorarios.Add(hr);
                }

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                    connection.Close();
            }

            return lstHorarios;
        }

        public List<Pessoa> SelecionarPessoaHorario()
        {
            List<Pessoa> lstPessoas = new List<Pessoa>();

            var connection = new MySqlConnection(GetConnectionString());
            var command = connection.CreateCommand();

            try
            {
                connection.Open();
                command.CommandText = @"SELECT A.IDUSUARIO, A.NOMECOMPLETO, C.HORARIO, C.IDHORARIO, A.TELEFONE FROM USUARIO A
                                            INNER JOIN USUARIO_HORARIO B ON A.IDUSUARIO = B.IDUSUARIO
                                            INNER JOIN HORARIO C ON C.IDHORARIO = B.IDHORARIO
                                            WHERE A.IND_ATIVO = 1
                                            ORDER BY C.IDHORARIO";
                var dr = command.ExecuteReader();

                while (dr.Read())
                {
                    Pessoa pess = new Pessoa();
                 
                    pess.IdPessoa = int.Parse(dr["IDUSUARIO"].ToString());
                    pess.NomeCompleto = dr["NOMECOMPLETO"].ToString();                   
                    pess.HorarioDeAte = dr["HORARIO"].ToString();
                    pess.IdHorario = int.Parse(dr["IDHORARIO"].ToString());
                    pess.Celular = dr["TELEFONE"].ToString();

                    lstPessoas.Add(pess);
                }

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                    connection.Close();
            }

            return lstPessoas;
        }

        public int ExcluirAgendamento(int idPessoa, int idHoario)
        {
            var connection = new MySqlConnection(GetConnectionString());
            var command = connection.CreateCommand();
            var command2 = connection.CreateCommand();
        
            try
            {
                connection.Open();
                command.CommandText = "UPDATE USUARIO SET IND_ATIVO = 0 WHERE IDUSUARIO = @IdUsuario";
                command.Parameters.AddWithValue("@IdUsuario", idPessoa);
                command.ExecuteNonQuery();

                command2.CommandText = "UPDATE HORARIO SET QUANTIDADE = QUANTIDADE + 1 WHERE idHorario = @idHorario";
                command2.Parameters.AddWithValue("@idHorario", idHoario);
                command2.ExecuteNonQuery();

            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                    connection.Close();
            }

            return 1;
        }


    }
}