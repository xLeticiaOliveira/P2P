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
            'Diversão'
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
            'Ação',
            'MOBA',
            'FPS',
            'História',
            'Estratégia',
            'Casual',
            'Terror'
        ]
        gen = GeneroController()
        for g in genero:
            gen.insertGenero(xgenero=g)


        #########################################################
        jogos = [
            {'nome': 'Rainbow Six Siege', 'genero': ['Digital', 'Online', 'FPS', 'Estratégia']},
            {'nome': 'Rocket League', 'genero': ['Digital', 'Online', 'Esporte', 'Casual']},
            {'nome': 'Outlast', 'genero': ['Digital', 'Terror']},
            {'nome': 'Vôlei', 'genero': ['Fisico', 'Esporte']}
        ]
        jog = JogoController()
        for j in jogos:
            jog.insertJogo(nome=j['nome'], generos=j['genero'])


        #########################################################
        usuarios = [
            {'nome': 'Vinicius Souza', 'localizacao': 'São Paulo, SP', 'idade': 25},
            {'nome': 'Luana Pereira', 'localizacao': 'São Paulo, SP', 'idade': 21},
            {'nome': 'Caroline de Prado', 'localizacao': 'Sorocaba, SP', 'idade': 19}
        ]
        usu = UsuarioController()
        for u in usuarios:
            usu.insertUsuario(nome=u['nome'], localizacao=u['localizacao'], idade=u['idade'])


        #########################################################
        jogador = [
            {'idUsu': 1, 'idJogo': 1, 'perfilDeJogo': 1, 'rank': 'Ouro', 'plataforma': 1},
            {'idUsu': 1, 'idJogo': 2, 'perfilDeJogo': 4, 'rank': 'Ouro', 'plataforma': 1},
            {'idUsu': 1, 'idJogo': 3, 'perfilDeJogo': 1, 'rank': '', 'plataforma': 1},
            {'idUsu': 2, 'idJogo': 1, 'perfilDeJogo': 3, 'rank': 'Diamante', 'plataforma': 2},
            {'idUsu': 2, 'idJogo': 2, 'perfilDeJogo': 4, 'rank': 'Bronze', 'plataforma': 2},
            {'idUsu': 3, 'idJogo': 4, 'perfilDeJogo': 4, 'rank': '', 'plataforma': -1},
        ]
        jog = JogadorController()
        for j in jogador:
            jog.insertJogador(idUsu=j['idUsu'], idJogo=j['idJogo'], idPerfil=j['perfilDeJogo'], idPlataforma=j['plataforma'], rank=j['rank'])

