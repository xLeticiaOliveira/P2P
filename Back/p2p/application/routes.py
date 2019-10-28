from flask import render_template, Blueprint
from flask import jsonify, make_response, request, abort
from application.modelsController import *
from application.modelsController import JSONConverter

app = Blueprint('app', __name__,
    template_folder='templates')
convertToJSON = JSONConverter().converterParaJSON

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)


# /search-games - games com alguma letra ou palavra lá (usar na busca) -> manda get com oqe a pessoa digitou na busca
# /perfil-game - pessoas que jogam algum jogo -> get com o jogo selecionado
# /perfil - retorna o perfil de alguem com base no id -> get com o id da pessoa
# /create-account -> post com as infos

@app.route("/search-games/<string:letra>", methods=['GET'])
def searchGames(letra):
    jc = JogoController()
    jogos = jc.procurarJogo(letra)
    return jsonify({'jogos' : convertToJSON(jogos)}), 200


@app.route("/perfil-game/<string:nomeJogo>", methods=['GET'])
def perfilGame(nomeJogo):
    jc = JogoController()
    jogadores = jc.getJogadores(nomeJogo)
    jogadores = convertToJSON(jogadores)
    jgc = JogadorController()
    for jogador in jogadores:
        jgc.prepararInfosExibicao(objJogador=jogador)

    return jsonify({'jogadores' : jogadores}), 200


@app.route("/create-account", methods=['POST'])
def createAccount():
    uc = UsuarioController()
    uc.insertUsuario(nome=request.json['nome'], localizacao=request.json['localizacao'], idade=request.json['idade'], email=request.json['email'], senha=request.json['senha'])
    return jsonify({}), 200

@app.route("/create-group", methods=['POST'])
def createGroup():
    import pdb
    pdb.set_trace()
    gc = GrupoController()
    gc.insertGrupo(idUsuDono=request.json['idUsuDono'],idPlataforma=request.json['idPlataforma'],idJogo=request.json['idJogo'],usuarios=request.json['usuarios'])
    return jsonify({}), 200

@app.route("/add-integrante", methods=['POST'])
def addIntegrante():
    gc = GrupoController()
    gc.addIntegrante(idGrupo=request.json['idGrupo'], idUsu=request.json['idUsu'])
    return jsonify({}), 200

@app.route("/search-group/<string:nomeJogo>", methods=['GET'])
def searchGroup(nomeJogo):
    gc = GrupoController()
    grupos = gc.searchGrupoByJogo(nomeJogo=nomeJogo)
    return jsonify({'grupos': convertToJSON(grupos)}), 200

@app.route("/")
def main():
    return jsonify({'erro': 'Algo de errado aconteceu, nene.'}), 400
