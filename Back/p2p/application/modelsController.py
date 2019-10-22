from application.models import *


class UsuarioController:

    def insertUsuario(self, nome, localizacao, idade):
        usuario = Usuario()
        usuario.nome = nome
        usuario.localizacao = localizacao
        usuario.idade = idade
        usuario.save()


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


class GeneroController:
    
    def insertGenero(self, xgenero):
        genero = Genero.query.filter_by(genero=xgenero).first()
        if genero is None:
            genero = Genero()
            genero.genero = xgenero
            genero.save()


class PerfilController:
    
    def insertPerfil(self, xperfil):
        perfil = Perfil.query.filter_by(perfil=xperfil)
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

    def insertJogador(self, idUsu, idJogo, idPerfil, idPlataforma, rank):
        jogador = Jogador.query.filter_by(usuario=idUsu, jogo=idJogo).first()
        if jogador is None:
            jogador = Jogador()
            jogador.usuario = Usuario.query.filter_by(id=idUsu).first().id
            jogador.jogo = Jogo.query.filter_by(id=idJogo).first().id

        if (idPlataforma > 0):
            jogador.plataforma = Plataforma.query.filter_by(id=idPlataforma).first().id
        jogador.perfil = Perfil.query.filter_by(id=idPerfil).first().id
        if rank != '':
            jogador.rank = rank
        jogador.save()
