import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and 0ve to reload.
        </p>
        <a
          className="App-link"
          href="https://5pgbk69ouh.execute-api.us-east-1.amazonaws.com/GetStartedLambdaProxyIntegration"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
