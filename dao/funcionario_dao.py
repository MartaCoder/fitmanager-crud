from dao.conexao import conectar
from models.funcionario import Funcionario

class FuncionarioDAO:

    def inserir(self, funcionario):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "INSERT INTO Funcionario (nome, cargo, salario) VALUES (%s, %s, %s) RETURNING id_funcionario"
        cursor.execute(sql, (funcionario.nome, funcionario.cargo, funcionario.salario))
        novo_id = cursor.fetchone()[0]
        conexao.commit()
        cursor.close()
        conexao.close()
        return novo_id

    def listar_todos(self):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Funcionario ORDER BY id_funcionario")
        linhas = cursor.fetchall()
        cursor.close()
        conexao.close()

        lista = []
        for linha in linhas:
            funcionario = Funcionario(linha[0], linha[1], linha[2], linha[3])
            lista.append(funcionario)
        return lista

    def buscar_por_id(self, id_funcionario):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Funcionario WHERE id_funcionario = %s", (id_funcionario,))
        linha = cursor.fetchone()
        cursor.close()
        conexao.close()

        if linha is None:
            return None
        return Funcionario(linha[0], linha[1], linha[2], linha[3])

    def atualizar(self, funcionario):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "UPDATE Funcionario SET nome=%s, cargo=%s, salario=%s WHERE id_funcionario=%s"
        cursor.execute(sql, (funcionario.nome, funcionario.cargo, funcionario.salario, funcionario.id_funcionario))
        conexao.commit()
        cursor.close()
        conexao.close()

    def deletar(self, id_funcionario):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("DELETE FROM Funcionario WHERE id_funcionario = %s", (id_funcionario,))
        conexao.commit()
        cursor.close()
        conexao.close()
