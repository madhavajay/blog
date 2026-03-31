export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const { pathname, search } = url;

    const isGetLike = request.method === 'GET' || request.method === 'HEAD';
    const lastSegment = pathname.split('/').pop() || '';
    const hasExtension = lastSegment.includes('.');

    if (isGetLike && pathname !== '/' && !pathname.endsWith('/') && !hasExtension) {
      return Response.redirect(`${url.origin}${pathname}/${search}`, 308);
    }

    return env.ASSETS.fetch(request);
  },
};
