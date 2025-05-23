// biome-ignore lint/suspicious/noShadowRestrictedNames: <explanation>
export default (req, res) => {
  res.status(200).json({ text: 'Hello' });
};
