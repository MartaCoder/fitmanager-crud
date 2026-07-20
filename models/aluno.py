class Aluno:
    def __init__(self, id_aluno=None, nome="", data_nascimento=None, email="", cpf="", numero="", cep="", bairro="", rua=""):
        self.id_aluno = id_aluno
        self.nome = nome
        self.data_nascimento = data_nascimento
        self.email = email
        self.cpf = cpf
        self.numero = numero
        self.cep = cep
        self.bairro = bairro
        self.rua = rua

    def __str__(self):
        return f"{self.id_aluno} - {self.nome} - {self.email} - {self.cpf}"
