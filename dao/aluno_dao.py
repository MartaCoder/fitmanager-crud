from dao.conexao import conectar
from models.aluno import Aluno

class AlunoDAO:

    def inserir(self, aluno):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "INSERT INTO Aluno (nome, data_nascimento, email, cpf, numero, cep, bairro, rua) VALUES (%s, %s, %s, %s, %s, %s, %s, %s) RETURNING id_aluno"
        cursor.execute(sql, (aluno.nome, aluno.data_nascimento, aluno.email, aluno.cpf, aluno.numero, aluno.cep, aluno.bairro, aluno.rua))
        novo_id = cursor.fetchone()[0]
        conexao.commit()
        cursor.close()
        conexao.close()
        return novo_id

    def listar_todos(self):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Aluno ORDER BY id_aluno")
        linhas = cursor.fetchall()
        cursor.close()
        conexao.close()

        lista = []
        for linha in linhas:
            aluno = Aluno(linha[0], linha[1], linha[2], linha[3], linha[4], linha[5], linha[6], linha[7], linha[8])
            lista.append(aluno)
        return lista

    def buscar_por_id(self, id_aluno):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Aluno WHERE id_aluno = %s", (id_aluno,))
        linha = cursor.fetchone()
        cursor.close()
        conexao.close()

        if linha is None:
            return None
        return Aluno(linha[0], linha[1], linha[2], linha[3], linha[4], linha[5], linha[6], linha[7], linha[8])

    def atualizar(self, aluno):
        conexao = conectar()
        cursor = conexao.cursor()

        sql = """
        UPDATE Aluno
        SET nome = %s,
            data_nascimento = %s,
            email = %s,
            cpf = %s,
            numero = %s,
            cep = %s,
            bairro = %s,
            rua = %s
        WHERE id_aluno = %s
    """

        cursor.execute(
        sql,
        (
            aluno.nome,
            aluno.data_nascimento,
            aluno.email,
            aluno.cpf,
            aluno.numero,
            aluno.cep,
            aluno.bairro,
            aluno.rua,
            aluno.id_aluno
        )
    )

        conexao.commit()
        cursor.close()
        conexao.close()

    def deletar(self, id_aluno):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("DELETE FROM Aluno WHERE id_aluno = %s", (id_aluno,))
        conexao.commit()
        cursor.close()
        conexao.close()

    def listar_com_plano(self):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = """
        SELECT a.nome, p.nome, m.status
        FROM Matricula m
        JOIN Aluno a ON a.id_aluno = m.idAluno
        JOIN Plano p ON p.id_plano = m.idPlano
        """
        cursor.execute(sql)
        resultado = cursor.fetchall()
        cursor.close()
        conexao.close()
        return resultado
