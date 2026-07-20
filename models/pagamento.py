class Pagamento:
    def __init__(self, id_pagamento=None, id_matricula=None, id_funcionario=None, data_vencimento=None, data_pagamento=None, valor=0, status=False):
        self.id_pagamento = id_pagamento
        self.id_matricula = id_matricula
        self.id_funcionario = id_funcionario
        self.data_vencimento = data_vencimento
        self.data_pagamento = data_pagamento
        self.valor = valor
        self.status = status

    def __str__(self):
        return f"{self.id_pagamento} - matricula {self.id_matricula} - R${self.valor} - pago: {self.status}"
