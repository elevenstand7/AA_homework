import coffeeBeans from "./mockData/coffeeBeans.json";
import SetCoffeeBean from './components/SetCoffeeBean.js';
import SelectedCoffeeBean from "./components/SelectedCoffeeBean.js";
function App() {
  return (
    <>
      <h1>Welcome to Coffee App</h1>
      <SelectedCoffeeBean />
      <SetCoffeeBean  coffeeBeans={coffeeBeans} />
    </>
  );
}

export default App;
