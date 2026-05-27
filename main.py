from flask import Flask, render_template, request
from pyswip import Prolog

app = Flask(__name__)
prolog = Prolog()

# Carrega a base de conhecimento Prolog
prolog.consult('main.pl')

@app.route('/', methods=['GET', 'POST'])
def index():
    receitas_encontradas = []
    sugestoes = []
    pesquisou = False
    ing = ""

    if request.method == 'POST':
        pesquisou = True
        ing = request.form.get('ingrediente_unico', '').strip().lower()
        
        if ing:
            # 1. Busca receitas e status via Prolog
            # Consulta busca em ambas as posições (Ing1 ou Ing2)
            query = f"status_saude('{ing}', _, Nome, Status); status_saude(_, '{ing}', Nome, Status)"
            
            # Usamos um conjunto (set) para garantir resultados únicos e evitar duplicatas
            conjunto_receitas = set()
            for res in prolog.query(query):
                nome = str(res['Nome']).replace('_', ' ').title()
                status = str(res['Status'])
                conjunto_receitas.add((nome, status))
            
            receitas_encontradas = [{'nome': item[0], 'status': item[1]} for item in conjunto_receitas]

            # 2. Se não encontrou nada, busca sugestões de substituição
            if not receitas_encontradas:
                query_troca = f"sugestao_troca('{ing}', Sugestao)"
                # Filtra sugestões únicas
                sugestoes = list(set(str(res['Sugestao']) for res in prolog.query(query_troca)))

    return render_template('index.html', 
                           receitas=receitas_encontradas, 
                           sugestoes=sugestoes, 
                           pesquisou=pesquisou, 
                           ing=ing)

if __name__ == "__main__":
    # Vamos rodar SEM o Prolog no momento do start para ver se o Flask sobe
    app.run(host='0.0.0.0', port=5001)