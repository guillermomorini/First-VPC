exports.handler = async (event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Yo yo from Lambda!'),
    };
    return response;
};
