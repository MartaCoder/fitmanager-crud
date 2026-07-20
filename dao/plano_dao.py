from dao.conexao import conectar
from models.plano import Plano

class PlanoDAO:

    def inserir(self, plano):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "INSERT INTO Plano (nome, descricao, valor_mensal, duracao) VALUES (%s, %s, %s, %s) RETURNING id_plano"
        cursor.execute(sql, (plano.nome, plano.descricao, plano.valor_mensal, plano.duracao))
        novo_id = cursor.fetchone()[0]
        conexao.commit()
        cursor.close()
        conexao.close()
        return novo_id

    def listar_todos(self):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Plano ORDER BY id_plano")
        linhas = cursor.fetchall()
        cursor.close()
        conexao.close()

        lista = []
        for linha in linhas:
            plano = Plano(linha[0], linha[1], linha[2], linha[3], linha[4])
            lista.append(plano)
        return lista

    def buscar_por_id(self, id_plano):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Plano WHERE id_plano = %s", (id_plano,))
        linha = cursor.fetchone()
        cursor.close()
        conexao.close()

        if linha is None:
            return None
        return Plano(linha[0], linha[1], linha[2], linha[3], linha[4])

    def atualizar(self, plano):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "UPDATE Plano SET nome=%s, descricao=%s, valor_mensal=%s, duracao=%s WHERE id_plano=%s"
        cursor.execute(sql, (plano.nome, plano.descricao, plano.valor_mensal, plano.duracao, plano.id_plano))
        conexao.commit()
        cursor.close()
        conexao.close()

    def deletar(self, id_plano):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("DELETE FROM Plano WHERE id_plano = %s", (id_plano,))
        conexao.commit()
        cursor.close()
        conexao.close()
