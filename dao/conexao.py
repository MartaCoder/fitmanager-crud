import psycopg2

def conectar():
    conexao = psycopg2.connect(
        host="localhost",
        port="5432",
        database="bdfit",
        user="postgres",
        password="" #coloque a senha do banco de dados 
    )
    return conexao
