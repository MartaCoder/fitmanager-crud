class Plano:
    def __init__(self, id_plano=None, nome="", descricao="", valor_mensal=0, duracao=0):
        self.id_plano = id_plano
        self.nome = nome
        self.descricao = descricao
        self.valor_mensal = valor_mensal
        self.duracao = duracao

    def __str__(self):
        return f"{self.id_plano} - {self.nome} - R${self.valor_mensal} - {self.duracao} meses"
