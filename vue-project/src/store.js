import { createStore } from 'vuex'

export default createStore({
    state() {
        return {
            currentComponent: 'LoginList'
        }
    },
    mutations: {
        updateComponent(state, componentName) {
            state.currentComponent = componentName
        }
    }
})