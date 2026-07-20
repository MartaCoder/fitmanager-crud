class Matricula:
    def __init__(self, id_matricula=None, id_aluno=None, id_plano=None, data_inicio=None, data_fim=None, status=True):
        self.id_matricula = id_matricula
        self.id_aluno = id_aluno
        self.id_plano = id_plano
        self.data_inicio = data_inicio
        self.data_fim = data_fim
        self.status = status

    def __str__(self):
        return f"{self.id_matricula} - aluno {self.id_aluno} - plano {self.id_plano} - status {self.status}"
