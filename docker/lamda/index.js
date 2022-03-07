exports.handler = async (event) => {
    if (process.env.cmpy === 'thbs') {
        console.log('exculting code for thbs')
        return process.env.cmpy;
    } else {
        const response = {
            statusCode: 200,
            body: JSON.stringify('Hello from Lambda!'),
        };
        return response;
    }
};
