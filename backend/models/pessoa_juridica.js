import { Sequelize } from "sequelize";
import db from '../config/db.js'
import Colaborador from './colaborador.js'

const PessoaJuridica = db.define('Pessoa_Juridicas',{
    colaborador_id:{
        type:Sequelize.INTEGER,
        primaryKey: true
    },
    cnpj:{
        type:Sequelize.STRING,
        allowNull:true,
    },
    empresa_contratada:{
        type:Sequelize.STRING,
        allowNull:true
    },
    tempo_formalizacao:{
        type:Sequelize.STRING,
        allowNull: true
    },
    natureza_juridica:{
        type:Sequelize.STRING,
        allowNull:true
    },
    data_fundacao:{
        type:Sequelize.STRING,
        allowNull:true
    }  
})

PessoaJuridica.Colaborador = PessoaJuridica.belongsTo(Colaborador,{foreignKey:{name:'colaborador_id'}})
Colaborador.PessoaJuridica = Colaborador.hasOne(PessoaJuridica,{foreignKey:'colaborador_id'})

export default PessoaJuridica