from dao.conexao import conectar
from models.matricula import Matricula

class MatriculaDAO:

    def inserir(self, matricula):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "INSERT INTO Matricula (idAluno, idPlano, data_inicio, data_fim, status) VALUES (%s, %s, %s, %s, %s) RETURNING id_matricula"
        cursor.execute(sql, (matricula.id_aluno, matricula.id_plano, matricula.data_inicio, matricula.data_fim, matricula.status))
        novo_id = cursor.fetchone()[0]
        conexao.commit()
        cursor.close()
        conexao.close()
        return novo_id

    def listar_todos(self):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Matricula ORDER BY id_matricula")
        linhas = cursor.fetchall()
        cursor.close()
        conexao.close()

        lista = []
        for linha in linhas:
            matricula = Matricula(linha[0], linha[1], linha[2], linha[3], linha[4], linha[5])
            lista.append(matricula)
        return lista

    def buscar_por_id(self, id_matricula):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Matricula WHERE id_matricula = %s", (id_matricula,))
        linha = cursor.fetchone()
        cursor.close()
        conexao.close()

        if linha is None:
            return None
        return Matricula(linha[0], linha[1], linha[2], linha[3], linha[4], linha[5])

    def atualizar(self, matricula):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "UPDATE Matricula SET data_fim=%s, status=%s WHERE id_matricula=%s"
        cursor.execute(sql, (matricula.data_fim, matricula.status, matricula.id_matricula))
        conexao.commit()
        cursor.close()
        conexao.close()

    def deletar(self, id_matricula):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("DELETE FROM Matricula WHERE id_matricula = %s", (id_matricula,))
        conexao.commit()
        cursor.close()
        conexao.close()
