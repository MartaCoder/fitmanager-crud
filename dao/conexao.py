import psycopg2

def conectar():
    conexao = psycopg2.connect(
        host="localhost",
        port="5432",
        database="bdfit",
        user="postgres",
        password="123456789" #coloque a senha do banco de dados 
    )
    return conexao
