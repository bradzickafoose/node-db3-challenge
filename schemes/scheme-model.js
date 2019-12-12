const db = require('../data/dbConfig')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first()
}

function findSteps(id) {
    return db('steps')
        .where({ scheme_id: id })
        .orderBy('step_number')
}

function add(scheme) {
    return db('schemes')
        .insert(scheme, 'id')
        .then(id => {
            return findById(id[0])
        })
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
}

async function remove(id) {
    const scheme = await findById(id)
    return db('schemes')
        .where({ id })
        .del()
        .then(() => scheme)
}