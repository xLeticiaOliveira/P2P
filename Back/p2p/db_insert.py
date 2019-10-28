from application.modelsController import *

class PopulateDB:

    def populate(self):
        #########################################################
        plataforma = [
            'Steam',
            'Origin',
            'PS4',
            'XboxOne'
        ]
        plat = PlataformaController()
        for p in plataforma:
            plat.insertPlataforma(xplataforma=p)


        #########################################################
        perfil = [
            'Casual',
            'Profissional',
            'Aspirante',
            'Diversao'
        ]
        perf = PerfilController()
        for p in perfil:
            perf.insertPerfil(xperfil=p)


        #########################################################
        genero = [
            'Fisico',
            'Digital',
            'Online',
            'Esporte',
            'Carta',
            'Tabuleiro',
            'RPG',
            'Acao',
            'MOBA',
            'FPS',
            'História',
            'Estrategia',
            'Casual',
            'Terror'
        ]
        gen = GeneroController()
        for g in genero:
            gen.insertGenero(xgenero=g)


        #########################################################
        jogos = [
            {'nome': 'Rainbow Six Siege', 'genero': ['Digital', 'Online', 'FPS', 'Estrategia']},
            {'nome': 'Rocket League', 'genero': ['Digital', 'Online', 'Esporte', 'Casual']},
            {'nome': 'Outlast', 'genero': ['Digital', 'Terror']},
            {'nome': 'Vôlei', 'genero': ['Fisico', 'Esporte']}
        ]
        jog = JogoController()
        for j in jogos:
            jog.insertJogo(nome=j['nome'], generos=j['genero'])


        #########################################################
        usuarios = [
            {'nome': 'Vinicius Souza', 'localizacao': 'Sao Paulo, SP', 'idade': 25, 'email' : 'vini@hotmail.com', 'senha' : 'fedido'},
            {'nome': 'Luana Pereira', 'localizacao': 'Sao Paulo, SP', 'idade': 21, 'email' : 'luana@gmail.com', 'senha' : '123456'},
            {'nome': 'Caroline de Prado', 'localizacao': 'Sorocaba, SP', 'idade': 19, 'email' : 'carol@yahoo.com', 'senha' : 'carol123'}
        ]
        usu = UsuarioController()
        for u in usuarios:
            usu.insertUsuario(nome=u['nome'], localizacao=u['localizacao'], idade=u['idade'], email=u['email'], senha=u['senha'])


        #########################################################
        jogador = [
            {'idUsu': 1, 'idJogo': 1, 'perfilDeJogo': 1, 'rank': 'Ouro', 'plataforma': 2, 'nick' : 'DeusGod'},
            {'idUsu': 1, 'idJogo': 2, 'perfilDeJogo': 4, 'rank': 'Ouro', 'plataforma': 1, 'nick' : '70correr'},
            {'idUsu': 1, 'idJogo': 3, 'perfilDeJogo': 1, 'rank': '', 'plataforma': 1, 'nick' : 'WumpusCrew'},
            {'idUsu': 2, 'idJogo': 1, 'perfilDeJogo': 3, 'rank': 'Diamante', 'plataforma': 2, 'nick' : 'Fainne'},
            {'idUsu': 3, 'idJogo': 2, 'perfilDeJogo': 4, 'rank': 'Bronze', 'plataforma': 1, 'nick' : 'LetsEat'},
            {'idUsu': 3, 'idJogo': 4, 'perfilDeJogo': 4, 'rank': '', 'plataforma': -1, 'nick' : None},
        ]
        jog = JogadorController()
        for j in jogador:
            jog.insertJogador(idUsu=j['idUsu'], idJogo=j['idJogo'], idPerfil=j['perfilDeJogo'], idPlataforma=j['plataforma'], rank=j['rank'], nick=j['nick'])

        #########################################################
        grupo = [
            {'idUsuDono': 1, 'jogo': 2, 'plataforma': 1, 'usuarios':[1, 3]},
            {'idUsuDono': 2, 'jogo': 1, 'plataforma': 1, 'usuarios':[1, 2]}
        ]
        grup = GrupoController()
        for g in grupo:
            grup.insertGrupo(idUsuDono=g['idUsuDono'], idJogo=g['jogo'], idPlataforma=g['plataforma'], usuarios=g['usuarios'])

