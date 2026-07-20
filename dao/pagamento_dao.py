from dao.conexao import conectar
from models.pagamento import Pagamento

class PagamentoDAO:

    def inserir(self, pagamento):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "INSERT INTO Pagamento (idMatricula, idFuncionario, data_vencimento, data_pagamento, valor, status) VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_pagamento"
        cursor.execute(sql, (pagamento.id_matricula, pagamento.id_funcionario, pagamento.data_vencimento, pagamento.data_pagamento, pagamento.valor, pagamento.status))
        novo_id = cursor.fetchone()[0]
        conexao.commit()
        cursor.close()
        conexao.close()
        return novo_id

    def listar_todos(self):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Pagamento ORDER BY id_pagamento")
        linhas = cursor.fetchall()
        cursor.close()
        conexao.close()

        lista = []
        for linha in linhas:
            pagamento = Pagamento(linha[0], linha[1], linha[2], linha[3], linha[4], linha[5], linha[6])
            lista.append(pagamento)
        return lista

    def buscar_por_id(self, id_pagamento):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("SELECT * FROM Pagamento WHERE id_pagamento = %s", (id_pagamento,))
        linha = cursor.fetchone()
        cursor.close()
        conexao.close()

        if linha is None:
            return None
        return Pagamento(linha[0], linha[1], linha[2], linha[3], linha[4], linha[5], linha[6])

    def atualizar(self, pagamento):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "UPDATE Pagamento SET data_pagamento=%s, status=%s WHERE id_pagamento=%s"
        cursor.execute(sql, (pagamento.data_pagamento, pagamento.status, pagamento.id_pagamento))
        conexao.commit()
        cursor.close()
        conexao.close()

    def deletar(self, id_pagamento):
        conexao = conectar()
        cursor = conexao.cursor()
        cursor.execute("DELETE FROM Pagamento WHERE id_pagamento = %s", (id_pagamento,))
        conexao.commit()
        cursor.close()
        conexao.close()

    def total_por_status(self):
        conexao = conectar()
        cursor = conexao.cursor()
        sql = "SELECT status, SUM(valor), COUNT(*) FROM Pagamento GROUP BY status"
        cursor.execute(sql)
        resultado = cursor.fetchall()
        cursor.close()
        conexao.close()
        return resultado
