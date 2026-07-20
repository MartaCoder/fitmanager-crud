class Funcionario:
    def __init__(self, id_funcionario=None, nome="", cargo="", salario=0):
        self.id_funcionario = id_funcionario
        self.nome = nome
        self.cargo = cargo
        self.salario = salario

    def __str__(self):
        return f"{self.id_funcionario} - {self.nome} - {self.cargo} - R${self.salario}"
