import { Router }  from "express";

import { getAllColaborador, testeCargo, testePessoaFisica,inserirDadosColab, geralFunc,inserirDadosColabCnpj} from "../controllers/colaborador.js";
import { inserirCargo } from "../controllers/insertCargo.js";

import {verifyJWT} from "../controllers/login.js"

const router = Router()

router.get('/', verifyJWT, getAllColaborador)
router.get('/pessoa', verifyJWT, testePessoaFisica)
router.get('/cargo', inserirCargo)
router.post('/novo', verifyJWT, inserirDadosColab)
router.get('/geral', verifyJWT,geralFunc)
router.post('/cnpj', verifyJWT, inserirDadosColabCnpj)

export default router