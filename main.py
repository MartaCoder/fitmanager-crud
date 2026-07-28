from dao.aluno_dao import AlunoDAO
from dao.plano_dao import PlanoDAO
from dao.funcionario_dao import FuncionarioDAO
from dao.matricula_dao import MatriculaDAO
from dao.pagamento_dao import PagamentoDAO

from models.aluno import Aluno
from models.plano import Plano
from models.funcionario import Funcionario
from models.matricula import Matricula
from models.pagamento import Pagamento

aluno_dao = AlunoDAO()
plano_dao = PlanoDAO()
funcionario_dao = FuncionarioDAO()
matricula_dao = MatriculaDAO()
pagamento_dao = PagamentoDAO()


def menu_aluno():
    while True:
        print("\n--- ALUNO ---")
        print("1 - Cadastrar")
        print("2 - Listar")
        print("3 - Atualizar")
        print("4 - Deletar")
        print("5 - Relatorio aluno + plano")
        print("0 - Voltar")
        opcao = input("Opcao: ")

        if opcao == "1":
            nome = input("Nome: ")
            data_nascimento = input("Data nascimento (AAAA-MM-DD): ")
            email = input("Email: ")
            cpf = input("CPF: ")
            numero = input("Numero: ")
            cep = input("CEP: ")
            bairro = input("Bairro: ")
            rua = input("Rua: ")
            aluno = Aluno(None, nome, data_nascimento, email, cpf, numero, cep, bairro, rua)
            novo_id = aluno_dao.inserir(aluno)
            print("Aluno cadastrado, id =", novo_id)

        elif opcao == "2":
            alunos = aluno_dao.listar_todos()
            for a in alunos:
                print(a)

        elif opcao == "3":
            id_aluno = int(input("Id do aluno: "))
            aluno = aluno_dao.buscar_por_id(id_aluno)

            if aluno is None:
                print("Aluno nao encontrado")
                continue

            print("Deixe em branco para nao alterar")

            nome = input(f"Nome novo [{aluno.nome}]: ")
            if nome != "":
                aluno.nome = nome

            data_nascimento = input(f"Data de nascimento nova [{aluno.data_nascimento}] (AAAA-MM-DD): ")
            if data_nascimento != "":
                aluno.data_nascimento = data_nascimento

            email = input(f"Email novo [{aluno.email}]: ")
            if email != "":
                aluno.email = email

            cpf = input(f"CPF novo [{aluno.cpf}]: ")
            if cpf != "":
                aluno.cpf = cpf

            numero = input(f"Numero novo [{aluno.numero}]: ")
            if numero != "":
                aluno.numero = numero

            cep = input(f"CEP novo [{aluno.cep}]: ")
            if cep != "":
                aluno.cep = cep

            bairro = input(f"Bairro novo [{aluno.bairro}]: ")
            if bairro != "":
                aluno.bairro = bairro

            rua = input(f"Rua nova [{aluno.rua}]: ")
            if rua != "":
                aluno.rua = rua

            aluno_dao.atualizar(aluno)
            print("Aluno atualizado com sucesso")

        elif opcao == "4":
            id_aluno = int(input("Id do aluno: "))
            aluno_dao.deletar(id_aluno)
            print("Deletado")

        elif opcao == "5":
            dados = aluno_dao.listar_com_plano()
            for linha in dados:
                print(linha)

        elif opcao == "0":
            break

        else:
            print("Opcao invalida")


def menu_plano():
    while True:
        print("\n--- PLANO ---")
        print("1 - Cadastrar")
        print("2 - Listar")
        print("3 - Atualizar")
        print("4 - Deletar")
        print("0 - Voltar")
        opcao = input("Opcao: ")

        if opcao == "1":
            nome = input("Nome: ")
            descricao = input("Descricao: ")
            valor_mensal = float(input("Valor mensal: "))
            duracao = int(input("Duracao em meses: "))
            plano = Plano(None, nome, descricao, valor_mensal, duracao)
            novo_id = plano_dao.inserir(plano)
            print("Plano cadastrado, id =", novo_id)

        elif opcao == "2":
            planos = plano_dao.listar_todos()
            for p in planos:
                print(p)

        elif opcao == "3":
            id_plano = int(input("Id do plano: "))
            plano = plano_dao.buscar_por_id(id_plano)
            if plano is None:
                print("Plano nao encontrado")
                continue
            valor = input(f"Valor mensal [{plano.valor_mensal}]: ")
            if valor != "":
                plano.valor_mensal = float(valor)
            plano_dao.atualizar(plano)
            print("Atualizado")

        elif opcao == "4":
            id_plano = int(input("Id do plano: "))
            plano_dao.deletar(id_plano)
            print("Deletado")

        elif opcao == "0":
            break

        else:
            print("Opcao invalida")


def menu_funcionario():
    while True:
        print("\n--- FUNCIONARIO ---")
        print("1 - Cadastrar")
        print("2 - Listar")
        print("3 - Atualizar")
        print("4 - Deletar")
        print("0 - Voltar")
        opcao = input("Opcao: ")

        if opcao == "1":
            nome = input("Nome: ")
            cargo = input("Cargo: ")
            salario = float(input("Salario: "))
            funcionario = Funcionario(None, nome, cargo, salario)
            novo_id = funcionario_dao.inserir(funcionario)
            print("Funcionario cadastrado, id =", novo_id)

        elif opcao == "2":
            funcionarios = funcionario_dao.listar_todos()
            for f in funcionarios:
                print(f)

        elif opcao == "3":
            id_funcionario = int(input("Id do funcionario: "))
            funcionario = funcionario_dao.buscar_por_id(id_funcionario)
            if funcionario is None:
                print("Funcionario nao encontrado")
                continue
            cargo = input(f"Cargo novo [{funcionario.cargo}]: ")
            if cargo != "":
                funcionario.cargo = cargo
            funcionario_dao.atualizar(funcionario)
            print("Atualizado")

        elif opcao == "4":
            id_funcionario = int(input("Id do funcionario: "))
            funcionario_dao.deletar(id_funcionario)
            print("Deletado")

        elif opcao == "0":
            break

        else:
            print("Opcao invalida")


def menu_matricula():
    while True:
        print("\n--- MATRICULA ---")
        print("1 - Cadastrar")
        print("2 - Listar")
        print("3 - Atualizar")
        print("4 - Deletar")
        print("0 - Voltar")
        opcao = input("Opcao: ")

        if opcao == "1":
            id_aluno = int(input("Id do aluno: "))
            id_plano = int(input("Id do plano: "))
            data_inicio = input("Data inicio (AAAA-MM-DD): ")
            data_fim = input("Data fim (pode deixar em branco): ")
            if data_fim == "":
                data_fim = None
            matricula = Matricula(None, id_aluno, id_plano, data_inicio, data_fim, True)
            novo_id = matricula_dao.inserir(matricula)
            print("Matricula cadastrada, id =", novo_id)

        elif opcao == "2":
            matriculas = matricula_dao.listar_todos()
            for m in matriculas:
                print(m)

        elif opcao == "3":
            id_matricula = int(input("Id da matricula: "))
            matricula = matricula_dao.buscar_por_id(id_matricula)
            if matricula is None:
                print("Matricula nao encontrada")
                continue
            ativa = input("Ainda esta ativa? (s/n): ")
            matricula.status = ativa.lower() == "s"
            matricula_dao.atualizar(matricula)
            print("Atualizado")

        elif opcao == "4":
            id_matricula = int(input("Id da matricula: "))
            matricula_dao.deletar(id_matricula)
            print("Deletado")

        elif opcao == "0":
            break

        else:
            print("Opcao invalida")


def menu_pagamento():
    while True:
        print("\n--- PAGAMENTO ---")
        print("1 - Cadastrar")
        print("2 - Listar")
        print("3 - Atualizar")
        print("4 - Deletar")
        print("5 - Relatorio total por status")
        print("0 - Voltar")
        opcao = input("Opcao: ")

        if opcao == "1":
            id_matricula = int(input("Id da matricula: "))
            id_funcionario = int(input("Id do funcionario: "))
            data_vencimento = input("Data vencimento (AAAA-MM-DD): ")
            data_pagamento = input("Data pagamento (deixe em branco se ainda nao pagou): ")
            if data_pagamento == "":
                data_pagamento = None
            valor = float(input("Valor: "))
            pago = input("Ja foi pago? (s/n): ")
            status = pago.lower() == "s"
            pagamento = Pagamento(None, id_matricula, id_funcionario, data_vencimento, data_pagamento, valor, status)
            novo_id = pagamento_dao.inserir(pagamento)
            print("Pagamento cadastrado, id =", novo_id)

        elif opcao == "2":
            pagamentos = pagamento_dao.listar_todos()
            for p in pagamentos:
                print(p)

        elif opcao == "3":
            id_pagamento = int(input("Id do pagamento: "))
            pagamento = pagamento_dao.buscar_por_id(id_pagamento)
            if pagamento is None:
                print("Pagamento nao encontrado")
                continue
            pago = input("Ja foi pago? (s/n): ")
            pagamento.status = pago.lower() == "s"
            pagamento_dao.atualizar(pagamento)
            print("Atualizado")

        elif opcao == "4":
            id_pagamento = int(input("Id do pagamento: "))
            pagamento_dao.deletar(id_pagamento)
            print("Deletado")

        elif opcao == "5":
            dados = pagamento_dao.total_por_status()
            for linha in dados:
                print(linha)

        elif opcao == "0":
            break

        else:
            print("Opcao invalida")


def menu_principal():
    while True:
        print("\n===== FITMANAGER =====")
        print("1 - Aluno")
        print("2 - Plano")
        print("3 - Funcionario")
        print("4 - Matricula")
        print("5 - Pagamento")
        print("0 - Sair")
        opcao = input("Escolha: ")

        if opcao == "1":
            menu_aluno()
        elif opcao == "2":
            menu_plano()
        elif opcao == "3":
            menu_funcionario()
        elif opcao == "4":
            menu_matricula()
        elif opcao == "5":
            menu_pagamento()
        elif opcao == "0":
            print("Saindo")
            break
        else:
            print("Opcao invalida")


menu_principal()
