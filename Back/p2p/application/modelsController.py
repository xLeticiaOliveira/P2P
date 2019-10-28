from application.models import Usuario, Jogo, Plataforma, Genero, Perfil, Jogador, Grupo
import copy

class JSONConverter:

    @staticmethod
    def converterParaJSON(obj):
        objJSON = []
        for o in obj:
            objJSON.append(o.as_dict())
        return objJSON

class UsuarioController:

    def insertUsuario(self, nome, localizacao, idade, email, senha):
        usuario = Usuario()
        usuario.nome = nome
        usuario.localizacao = localizacao
        usuario.idade = idade
        usuario.email = email
        usuario.senha = senha
        usuario.save()


class GrupoController:

    def insertGrupo(self, idUsuDono, idJogo, idPlataforma, usuarios):
        grupo = Grupo()
        grupo.idUsuDono = idUsuDono
        grupo.plataforma = idPlataforma
        grupo.jogo = idJogo
        for u in usuarios:
            usu = Usuario.query.filter_by(id=u).first()
            grupo.usuarios.append(usu)
        grupo.save()

    def addIntegrante(self, idGrupo, idUsu):
        grupo = Grupo.query.filter_by(id=idGrupo).first()
        try:
            grupo.usuarios.append(Usuario.query.filter_by(id=idUsu).first())
            grupo.save()
        except:
            pass

    def searchGrupoByJogo(self, nomeJogo):
        jogo = Jogo.query.filter_by(nome=nomeJogo).first()
        grupos = Grupo.query.filter_by(jogo=jogo.id).all()
        grupos = copy.deepcopy(grupos)
        for g in grupos:
            g.jogo = Jogo.query.filter_by(id=g.jogo).first().as_dict()
            g.plataforma = Plataforma.query.filter_by(id=g.plataforma).first().as_dict()
        return grupos

class JogoController:

    def insertJogo(self, nome, generos):
        jogo = Jogo.query.filter_by(nome=nome).first()
        if jogo is None:
            jogo = Jogo()
        jogo.nome = nome
        for g in generos:
            gen = Genero.query.filter_by(genero=g).first()
            jogo.generos.append(gen)
        jogo.save()

    def procurarJogo(self, letra):
        jogos = Jogo.query.filter(Jogo.nome.like('%' + str(letra) + '%')).all()
        return jogos

    def getJogadores(self, nome):
        jogo = Jogo.query.filter_by(nome=nome).first()
        return jogo.jogadoresJogo


class GeneroController:
    
    def insertGenero(self, xgenero):
        genero = Genero.query.filter_by(genero=xgenero).first()
        if genero is None:
            genero = Genero()
            genero.genero = xgenero
            genero.save()


class PerfilController:
    
    def insertPerfil(self, xperfil):
        perfil = Perfil.query.filter_by(perfil=xperfil).first()
        if perfil is None:
            perfil = Perfil()
            perfil.perfil = xperfil
            perfil.save()


class PlataformaController:

    def insertPlataforma(self, xplataforma):
        plataforma = Plataforma.query.filter_by(plataforma=xplataforma).first()
        if plataforma is None:
            plataforma = Plataforma()
            plataforma.plataforma = xplataforma
            plataforma.save()


class JogadorController:

    def insertJogador(self, idUsu, idJogo, idPerfil, idPlataforma, rank, nick):
        jogador = Jogador.query.filter_by(usuario=idUsu, jogo=idJogo).first()
        if jogador is None:
            jogador = Jogador()
            jogador.usuario = Usuario.query.filter_by(id=idUsu).first().id
            jogador.jogo = Jogo.query.filter_by(id=idJogo).first().id

        if (idPlataforma > 0):
            jogador.plataforma = Plataforma.query.filter_by(id=idPlataforma).first().id
        if nick != None and nick != '':
            jogador.nick = nick
        if rank != '' and rank != None:
            jogador.rank = rank
        jogador.perfil = Perfil.query.filter_by(id=idPerfil).first().id
        jogador.save()

    def prepararInfosExibicao(self, objJogador):
        objJogador['usuario'] = Usuario.query.filter_by(id=objJogador['usuario']).first().as_dict()
        objJogador['jogo'] = Jogo.query.filter_by(id=objJogador['jogo']).first().nome
        objJogador['perfil'] = Perfil.query.filter_by(id=objJogador['perfil']).first().perfil
        objJogador['plataforma'] = Plataforma.query.filter_by(id=objJogador['plataforma']).first().plataforma

        return objJogador


