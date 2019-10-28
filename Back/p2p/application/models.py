from config import db


class Base():
    def save(self):
        db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.remove(self)
        db.session.commit()

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}


generoJogo = db.Table('generoJogo',
                      db.Column('idJogo', db.Integer, db.ForeignKey('jogo.id')),
                      db.Column('idGenero', db.Integer, db.ForeignKey('genero.id'))
                      )

integrante = db.Table('integrante',
                        db.Column('idUsu', db.Integer, db.ForeignKey('usuario.id')),
                        db.Column('idGrupo', db.Integer, db.ForeignKey('grupo.id')),
                       )

class Usuario(db.Model, Base):
    __tablename__ = 'usuario'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(50), nullable=False)
    localizacao = db.Column(db.String(50))
    idade = db.Column(db.Integer)
    email = db.Column(db.Text)
    senha = db.Column(db.Text)

    def __repr__(self):
        return self.nome

    grupos = db.relationship("Grupo", secondary=integrante, back_populates="usuarios")

class Jogo(db.Model, Base):
    __tablename__ = 'jogo'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(50), unique=True, nullable=False)

    generos = db.relationship("Genero", secondary=generoJogo, back_populates="jogos")

    def __repr__(self):
        return self.nome


class Genero(db.Model, Base):
    __tablename__ = 'genero'
    id = db.Column(db.Integer, primary_key=True)
    genero = db.Column(db.String(50), unique=True, nullable=False)

    jogos = db.relationship("Jogo", secondary=generoJogo, back_populates="generos")

    def __repr__(self):
        return self.genero


class Perfil(db.Model, Base):
    __tablename__ = 'perfil'
    id = db.Column(db.Integer, primary_key=True)
    perfil = db.Column(db.String(50), unique=True, nullable=False)

    def __repr__(self):
        return self.perfil


class Plataforma(db.Model, Base):
    __tablename__ = 'plataforma'
    id = db.Column(db.Integer, primary_key=True)
    plataforma = db.Column(db.String(50), unique=True, nullable=False)

    def __repr__(self):
        return self.plataforma


class Jogador(db.Model, Base):
    __tablename__ = 'jogador'
    usuario = db.Column(db.Integer, db.ForeignKey('usuario.id'), primary_key=True)
    jogo = db.Column(db.Integer, db.ForeignKey('jogo.id'), primary_key=True)
    perfil = db.Column(db.Integer, db.ForeignKey('perfil.id'))
    plataforma = db.Column(db.Integer, db.ForeignKey('plataforma.id'))
    nick = db.Column(db.String(50))
    rank = db.Column(db.String(50))

    jogadoresPlat = db.relationship("Plataforma", lazy=True, backref="jogadoresPlat")
    jogadoresPerf = db.relationship("Perfil", lazy=True, backref="jogadoresPerf")
    jogadoresJogo = db.relationship("Jogo", backref="jogadoresJogo", lazy=True)
    jogadores = db.relationship("Usuario", backref="jogadores", lazy=True)

class Grupo(db.Model, Base):
    __tablename__ = "grupo"
    id = db.Column(db.Integer, primary_key=True)
    idUsuDono = db.Column(db.Integer, db.ForeignKey('usuario.id'))
    jogo = db.Column(db.Integer, db.ForeignKey('jogo.id'))
    plataforma = db.Column(db.Integer, db.ForeignKey('plataforma.id'))

    gruposPlat = db.relationship("Plataforma", lazy=True, backref="gruposPlat")
    gruposJogo = db.relationship("Jogo", backref="gruposJogo", lazy=True)

    usuarios = db.relationship("Usuario", secondary=integrante, back_populates="grupos")

